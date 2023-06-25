abstract class Newsstates {}

class Newsinitialstate extends Newsstates {}

class NewsbottomNav extends Newsstates {}


class Newsgetbusinesssuccessstate extends Newsstates{}

class Newsbussinessloadingstate extends Newsstates {}

class Newsgetbusinesserrorstate extends Newsstates {
  final String error;
  Newsgetbusinesserrorstate(this.error);
}
class Newsgetsportsuccessstate extends Newsstates{}

class Newssportloadingstate extends Newsstates {}

class Newsgetsporterrorstate extends Newsstates {
  final String error;
  Newsgetsporterrorstate(this.error);
}
class Newsgetsciencesuccessstate extends Newsstates{}

class Newsscienceloadingstate extends Newsstates {}

class Newsgetscienceerrorstate extends Newsstates {
  final String error;
  Newsgetscienceerrorstate(this.error);
}
class Themechangeapp extends Newsstates{}
class Newsgetsearchsuccessstate extends Newsstates{}

class Newssearchloadingstate extends Newsstates {}

class Newsgetsearcherrorstate extends Newsstates {
  final String error;
  Newsgetsearcherrorstate(this.error);
}