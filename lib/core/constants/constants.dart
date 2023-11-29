import 'package:logger/logger.dart';

const String baseUrl = 'https://nook-pal-api.onrender.com';
const String contentType = 'application/json';

const String firebaseStorageBucket = 'gs://bookpal-4f333.appspot.com';
const String booksCoversPath = 'books';
const String usersAvatarsPath = 'users';
const String companiesLogosPath = 'companies'; 

const String textPlaceholder = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisi. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisi. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisi. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisi.';

Logger logger = Logger();