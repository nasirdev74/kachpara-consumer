enum EditProductStateStatus {
  init,
  updateSuccessful,
  updateFailed,
  addSuccessful,
  addFailed,
  imageAddedSuccessfully,
  imageLoading,
  imageAddingFailed;

  static String? getMessage(EditProductStateStatus status) {
    switch (status) {
      case EditProductStateStatus.updateSuccessful:
        return 'Category update successful';
      case EditProductStateStatus.updateFailed:
        return 'Category update failed';
      case EditProductStateStatus.addSuccessful:
        return 'Category added successful';
      case EditProductStateStatus.addFailed:
        return 'Category adding failed';
      case EditProductStateStatus.imageAddedSuccessfully:
        return 'Image added successful';
      case EditProductStateStatus.imageAddingFailed:
        return 'Image adding failed';
      case EditProductStateStatus.init:
      case EditProductStateStatus.imageLoading:
      default:
        return null;
    }
  }
}
