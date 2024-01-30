
sealed class Either<L, R> {}

class Left<L, R> extends Either<L,R> {
  final L value;
  Left(this.value);
}

class Right<L, R> extends Either<L,R> {
  final R value;
  Right(this.value);
}