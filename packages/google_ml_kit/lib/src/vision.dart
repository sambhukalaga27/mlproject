import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// Get instance of the individual api's using instance of [Vision]
/// For example
/// To get an instance of [ImageLabeler]
// ImageLabeler imageLabeler = GoogleMlKit.instance.imageLabeler();
class Vision {
  Vision._();

  // Creates an instance of [GoogleMlKit] by calling the private constructor
  static final Vision instance = Vision._();

  // /// Get an instance of [ImageLabeler] by calling this function
  // /// [imageLabelerOptions]  if not provided it creates [ImageLabeler] with [ImageLabelerOptions]
  // /// You can provide either [LocalLabelerOptions] to use a custom tflite model
  // /// Or [AutoMLImageLabelerOptions] to use auto ml vision model trained by you
  // ImageLabeler imageLabeler([ImageLabelerOptions? imageLabelerOptions]) {
  //   return ImageLabeler(options: imageLabelerOptions ?? ImageLabelerOptions());
  // }

  /// Returns instance of [BarcodeScanner]. By default it searches the input image for all [BarcodeFormat]s.
  /// To limit the search model to specific [BarcodeFormat] pass list of [BarcodeFormat] as argument.
  BarcodeScanner barcodeScanner([List<BarcodeFormat>? formatList]) {
    return BarcodeScanner(formats: formatList ?? [BarcodeFormat.all]);
  }

  /// Return an instance of [TextRecognizer].
  TextRecognizer textRecognizer({script = TextRecognitionScript.latin}) {
    return TextRecognizer(script: script);
  }

  /// Returns an instance of [ObjectDetector].
  ObjectDetector objectDetector({required ObjectDetectorOptions options}) {
    return ObjectDetector(options: options);
  }
}
