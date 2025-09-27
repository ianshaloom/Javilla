class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final String? error;

  ApiResponse({required this.success, this.message, this.data, this.error});

  // Factory constructor for success response
  factory ApiResponse.success(T data, {String? message}) {
    return ApiResponse(success: true, data: data, message: message);
  }

  // Factory constructor for error response
  factory ApiResponse.error(String error, {String? message}) {
    return ApiResponse(success: false, error: error, message: message);
  }

  @override
  String toString() {
    return 'ApiResponse(success: $success, message: $message, data: $data, error: $error)';
  }
}
