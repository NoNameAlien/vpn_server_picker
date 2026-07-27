abstract interface class FeatureFlags {
  Future<void> initialize();

  bool get showAddKeyButton;
}
