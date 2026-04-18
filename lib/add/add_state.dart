class AddState {
  final bool isInitial;
  final bool isSucceed;

  AddState({
    required this.isInitial,
    required this.isSucceed,
  });

  factory AddState.initial() {
    return AddState(
      isInitial: true,
      isSucceed: false,
    );
  }

  AddState copyWith({
    bool? isInitial,
    bool? isSucceed,
  }) {
    return AddState(
      isInitial: isInitial ?? this.isInitial,
      isSucceed: isSucceed ?? this.isSucceed,
    );
  }
}