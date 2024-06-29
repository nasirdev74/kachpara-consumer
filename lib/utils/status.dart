enum Status {
  init,
  loading,
  success,
  failed,
}

extension StatusExt on Status {
  bool get isInit => this == Status.init;
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailed => this == Status.failed;
}
