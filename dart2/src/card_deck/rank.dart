abstract class Rank {
  const Rank();
  int get number;

  @override
  String toString() => "$number";
}

class Ace extends Rank {
  const Ace();
  @override
  int get number => 1;
}

class Two extends Rank {
  const Two();
  @override
  int get number => 2;
}

class Three extends Rank {
  const Three();
  @override
  int get number => 3;
}

class Four extends Rank {
  const Four();
  @override
  int get number => 4;
}

class Five extends Rank {
  const Five();
  @override
  int get number => 5;
}

class Six extends Rank {
  const Six();
  @override
  int get number => 6;
}

class Seven extends Rank {
  const Seven();
  @override
  int get number => 7;
}

class Eight extends Rank {
  const Eight();
  @override
  int get number => 8;
}

class Nine extends Rank {
  const Nine();
  @override
  int get number => 9;
}

class Ten extends Rank {
  const Ten();
  @override
  int get number => 10;
}

class Jack extends Rank {
  const Jack();
  @override
  int get number => 11;
}

class Queen extends Rank {
  const Queen();
  @override
  int get number => 12;
}

class King extends Rank {
  const King();
  @override
  int get number => 13;
}
