# CakeCup - Aplicativo de Confeitaria

Um aplicativo Flutter para uma confeitaria, com funcionalidades de e-commerce e uma interface moderna e amigável.

## 📋 Requisitos do Sistema

- Windows 10 ou superior
- Mínimo de 8GB de RAM (16GB recomendado)
- 10GB de espaço livre em disco
- Conexão com a internet

## 🛠️ Guia de Instalação

### 1. Visual Studio Code
1. Acesse [Visual Studio Code](https://code.visualstudio.com/)
2. Baixe a versão para Windows
3. Execute o instalador e siga as instruções
4. Instale as extensões recomendadas:
   - Flutter
   - Dart
   - Flutter Widget Snippets
   - Material Icon Theme

### 2. Flutter SDK
1. Acesse [Flutter SDK](https://docs.flutter.dev/get-started/install/windows)
2. Baixe o arquivo ZIP do Flutter SDK
3. Extraia o arquivo ZIP em um local de sua preferência (ex: C:\src\flutter)
4. Adicione o caminho do Flutter às variáveis de ambiente:
   - Abra o Painel de Controle > Sistema > Configurações avançadas do sistema
   - Clique em "Variáveis de Ambiente"
   - Em "Variáveis do Sistema", edite "Path"
   - Adicione o caminho completo para a pasta `flutter\bin`
5. Verifique a instalação abrindo o terminal e digitando:
   ```bash
   flutter doctor
   ```

### 3. Dart SDK
O Dart SDK já vem incluído no Flutter SDK, mas caso precise instalar separadamente:
1. Acesse [Dart SDK](https://dart.dev/get-dart)
2. Siga as instruções de instalação para Windows
3. Verifique a instalação:
   ```bash
   dart --version
   ```

### 4. Device Preview
1. Abra seu projeto Flutter
2. Adicione a dependência no `pubspec.yaml`:
   ```yaml
   dependencies:
     device_preview: ^1.1.0
   ```
3. Execute no terminal:
   ```bash
   flutter pub get
   ```

### Android Studio (Opcional)
Se desejar usar um emulador Android:
1. Baixe o [Android Studio](https://developer.android.com/studio)
2. Durante a instalação, certifique-se de selecionar:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device
3. Configure um emulador Android através do AVD Manager

## 🚀 Executando o Projeto

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/CakeCup.git
   ```

2. Navegue até a pasta do projeto:
   ```bash
   cd CakeCup
   ```

3. Instale as dependências:
   ```bash
   flutter pub get
   ```

4. Execute o projeto:
   ```bash
   flutter run
   ```

## 📱 Funcionalidades

- Sistema de login e cadastro
- Catálogo de produtos
- Carrinho de compras
- Lista de favoritos
- Busca de produtos
- Perfil do usuário
- Detalhes do produto

## 🎨 Paleta de Cores

- Rosa Pastel: #F9C6D1
- Bege Claro: #F2E2D2
- Pêssego Claro: #F8D0A4
- Azul Claro: #A8D8E8
- Dourado Claro: #E5C07B

## 📦 Dependências Principais

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^12.1.1
  provider: ^6.1.1
  device_preview: ^1.1.0


