import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKey {
  const ApiKey._();

  static final groqApiKey = dotenv.env['GROQ_API_KEY'] ?? '';
}
