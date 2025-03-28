import 'package:app_restaurante/services/providers.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_bottom_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _showEditDialog(BuildContext context, UserData userData) {
    final nameController = TextEditingController(text: userData.username);
    final addressController = TextEditingController(text: userData.address ?? '');
    final aboutController = TextEditingController(text: userData.about ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Editar Perfil'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  icon: Icon(Icons.person_outline),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Endereço',
                  icon: Icon(Icons.location_on_outlined),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: aboutController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Sobre mim',
                  icon: Icon(Icons.info_outline),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              userData.setName(nameController.text);
              if (addressController.text.isNotEmpty) {
                userData.setAddress(addressController.text);
              }
              if (aboutController.text.isNotEmpty) {
                userData.setAbout(aboutController.text);
              }
              Navigator.pop(context);
            },
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'Meu Perfil',
          style: AppTheme.titleStyle.copyWith(color: AppTheme.textColor),
        ),
      ),
      body: Consumer<UserData>(
        builder: (context, userData, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.primaryColor,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildInfoCard(
                  title: 'Nome',
                  value: userData.username,
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 16),
                _buildInfoCard(
                  title: 'Email',
                  value: userData.email,
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 16),
                _buildInfoCard(
                  title: 'Endereço',
                  value: userData.address ?? 'Não informado',
                  icon: Icons.location_on_outlined,
                ),
                const SizedBox(height: 16),
                _buildInfoCard(
                  title: 'Sobre mim',
                  value: userData.about ?? 'Não informado',
                  icon: Icons.info_outline,
                ),
                const SizedBox(height: 16),
                if (userData.preferences != null && userData.preferences!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Preferências',
                          style: AppTheme.subtitleStyle,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: userData.preferences!.map((preference) {
                          return Chip(
                            backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                            label: Text(
                              preference,
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _showEditDialog(context, userData),
                    style: AppTheme.primaryButtonStyle,
                    child: Text(
                      'Editar Perfil',
                      style: AppTheme.subtitleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomBar(selectedIndex: 3),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppTheme.primaryColor,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.subtitleStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: AppTheme.bodyTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 