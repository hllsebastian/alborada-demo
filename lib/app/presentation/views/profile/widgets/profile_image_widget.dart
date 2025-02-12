import 'dart:io';

import 'package:alborada_demo/app/presentation/views/profile/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageWidget extends StatefulWidget {
  final String? imageUrl; // URL de la imagen en Supabase

  const ProfileImageWidget({super.key, required this.imageUrl});

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  File? _selectedImage; // Imagen temporal antes de subirla

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });

      // Subir la imagen al backend a través del Cubit
      context.read<EditProfileCubit>().updateImageState(_selectedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImageSourceDialog(),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey[300],
        backgroundImage: _selectedImage != null
            ? FileImage(
                _selectedImage!) // Si el usuario ya seleccionó una imagen, mostrarla
            : (widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                ? NetworkImage(widget.imageUrl!) as ImageProvider
                : AssetImage(
                    // TODO: change default profile image fromo backend
                    'assets/images/png/star.png')), // Imagen predeterminada
        child: _selectedImage == null &&
                (widget.imageUrl == null || widget.imageUrl!.isEmpty)
            ? Icon(Icons.camera_alt, color: Colors.white, size: 30)
            : null, // Ícono si no hay imagen
      ),
    );
  }

  // Muestra un diálogo para elegir entre cámara o galería
  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Tomar foto'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Seleccionar de galería'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
