class AppError extends Error {
  final String code;
  final String message;
  final Function onError;

  AppError({
    this.code,
    this.message,
    this.onError,
  }) {
    print('\nError Code: $code\nMessage: $message\n');
  }
}
