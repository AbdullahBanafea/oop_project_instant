abstract class Person {
  final String name;
  final String phone;
  final String address;
  final int age;
  final int _id;
  final int _salary;

  Person(this.name, this.phone, this._id, this.address, this.age, this._salary);

  int get id => _id;
  int get salary => _salary;

  set _id(int id);
  set _salary(int salary);
}

class Employee implements Person {
  bool takeSalaryIsDone;
  int hoursWork;

  Employee(
      {required name,
      required phone,
      required address,
      required age,
      id,
      salary,
      required this.takeSalaryIsDone,
      required this.hoursWork});

  void setSalaryForEmployee(int setNum, Employee employee, Company company) {
    if (company is Manager) {
      for (int i = 0; i < company.listOfEmployee!.length; i++) {
        if (company == company.manager) {
          if (employee == company.listOfEmployee?[i]) {
            employee._salary = employee._salary + setNum;
            print("set salary successfully");
            break;
          } else {
            print("this employee not exist in ${company.name} company");
          }
        } else {
          print("you Are not manager of ${company.name} company");
        }
      }
    } else if (company is Accountant) {
      for (int i = 0; i < company.listOfEmployee!.length; i++) {
        if (company == company.accountant) {
          if (employee == company.listOfEmployee?[i]) {
            employee._salary = employee._salary + setNum;
            print("set salary successfully");
            break;
          } else {
            print("this employee not exist in ${company.name} company");
          }
        } else {
          print("you Are not accountant of ${company.name} company");
        }
      }
    }
  }

  @override
  int get _id => throw UnimplementedError();

  @override
  int get _salary => throw UnimplementedError();

  @override
  String get address => throw UnimplementedError();

  @override
  int get age => throw UnimplementedError();

  @override
  int get id => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  String get phone => throw UnimplementedError();

  @override
  int get salary => throw UnimplementedError();

  @override
  set _id(int id) {
    _id = id;
  }

  @override
  set _salary(int salary) {
    _salary = salary;
  }
}

class Manager extends Employee {
  Manager(
      {required super.name,
      required super.phone,
      required super.address,
      required super.age,
      required super.takeSalaryIsDone,
      required super.hoursWork});
}

class FlutterDeveloper extends Employee {
  final bool canUseBloc;
  final bool canUseFirebase;
  final bool canUseCleanArc;

  FlutterDeveloper(
    this.canUseBloc,
    this.canUseFirebase,
    this.canUseCleanArc, {
    required super.name,
    required super.phone,
    required super.address,
    required super.age,
    required super.takeSalaryIsDone,
    required super.hoursWork,
  });

  @override
  String toString() {
    return 'name : $name, phone : $phone, address : $address, age : $age, takeSalaryIsDone : $takeSalaryIsDone, hoursWork : $hoursWork, canUseBloc : $canUseBloc, canUseFirebase : $canUseFirebase, canUseCleanArc : $canUseCleanArc';
  }
}

class BackendDeveloper extends Employee {
  final bool canUseLaravel;
  final bool canUseDjango;
  final bool canUseExpressJs;

  BackendDeveloper(
    this.canUseLaravel,
    this.canUseDjango,
    this.canUseExpressJs, {
    required super.name,
    required super.phone,
    required super.address,
    required super.age,
    required super.takeSalaryIsDone,
    required super.hoursWork,
  });

  @override
  String toString() {
    return 'name : $name, phone : $phone, address : $address, age : $age, takeSalaryIsDone : $takeSalaryIsDone, hoursWork : $hoursWork, canUseLaravel : $canUseLaravel, canUseDjango : $canUseDjango, canUseExpressJs : $canUseExpressJs';
  }
}

class UiUxDeveloper extends Employee {
  final bool canUseFigma;
  final bool canUseAdobeXd;

  UiUxDeveloper(this.canUseFigma, this.canUseAdobeXd,
      {required super.name,
      required super.phone,
      required super.address,
      required super.age,
      required super.takeSalaryIsDone,
      required super.hoursWork});

  @override
  String toString() {
    return 'name : $name, phone : $phone, address : $address, age : $age, takeSalaryIsDone : $takeSalaryIsDone, hoursWork : $hoursWork, canUseFigma : $canUseFigma, canUseAdobeXd : $canUseAdobeXd';
  }
}

class Project {
  final String title;
  final int price;
  final DateTime receivingDate;
  final DateTime deadline;
  bool _isUiDone = false;
  bool _isFlutterDone = false;
  bool _isBackendDone = false;
  bool _isProjectDone = false;

  Project(
      {required this.title,
      required this.price,
      required this.receivingDate,
      required this.deadline});

  bool get isUiDone => _isUiDone;
  bool get isFlutterDone => _isFlutterDone;
  bool get isBackendDone => _isBackendDone;
  bool get isProjectDone => _isProjectDone;

  void uiFinished() {
    _isUiDone = true;

    if (_isUiDone == true && _isFlutterDone == true && _isBackendDone == true) {
      _isProjectDone = true;
    }
  }

  void flutterFinished() {
    _isFlutterDone = true;
    if (_isUiDone == true && _isFlutterDone == true && _isBackendDone == true) {
      _isProjectDone = true;
    }
  }

  void backendFinished() {
    _isBackendDone = true;
    if (_isUiDone == true && _isFlutterDone == true && _isBackendDone == true) {
      _isProjectDone = true;
    }
  }

  @override
  String toString() {
    return "project title : $title \n project price : $price \n project receivingDate : $receivingDate \n progect title : $deadline";
  }
}

class Team {
  String teamName;
  Employee teamLeader;
  List<FlutterDeveloper> flutterGroup;
  List<BackendDeveloper> backendGroup;
  List<UiUxDeveloper> uiUxGroup;
  List<Employee> allTeamDeveloper;
  List<Project> projects;

  Team(
      {required this.teamName,
      required this.teamLeader,
      required this.flutterGroup,
      required this.backendGroup,
      required this.uiUxGroup,
      required this.allTeamDeveloper,
      required this.projects});

  void showNamesFlutterDevelopers() {
    for (int i = 0; i < flutterGroup.length; i++) {
      if (flutterGroup.isEmpty) {
        print("there is no flutter developers");
        break;
      }
      print('${i + 1} : ${flutterGroup[i].name}');
    }
  }

  void showNamesBackendDevelopers() {
    for (int i = 0; i < backendGroup.length; i++) {
      if (backendGroup.isEmpty) {
        print("there is no backend developers");
        break;
      }
      print('${i + 1} : ${backendGroup[i].name}');
    }
  }

  void showNamesUiUxDevelopers() {
    for (int i = 0; i < uiUxGroup.length; i++) {
      if (uiUxGroup.isEmpty) {
        print("there is no ui/ux developers");
        break;
      }
      print('${i + 1} : ${uiUxGroup[i].name}');
    }
  }

  void showNameAllDevelopers() {
    print(
        "team name : $teamName \n team leader : ${teamLeader.name} \n flutter Group : ");
    showNamesFlutterDevelopers();
    print('backend Group : ');
    showNamesBackendDevelopers();
    print('uiUxGroup : ');
    showNamesUiUxDevelopers();
  }

  void addEmployeeToTeam(employee) {
    if (employee is FlutterDeveloper) {
      if (flutterGroup.length <= 8) {
        flutterGroup.add(employee);
        allTeamDeveloper.add(employee);
        print("added ${employee.name} to flutter group");
      } else {
        print("the Flutter group is full");
      }
    } else if (employee is BackendDeveloper) {
      if (backendGroup.length <= 5) {
        backendGroup.add(employee);
        allTeamDeveloper.add(employee);
        print("added ${employee.name} to backend group");
      } else {
        print("the backend group is full");
      }
    } else if (employee is UiUxDeveloper) {
      if (flutterGroup.length <= 2) {
        uiUxGroup.add(employee);
        allTeamDeveloper.add(employee);
        print("added ${employee.name} to uiUxGroup group");
      } else {
        print("the ui/UX group is full");
      }
    } else {
      print(
          "can't add this employee , the team want just flutter or backend or ui/ui developer");
    }
  }

  void removeEmployeeFromTeam(employee) {
    if (employee is FlutterDeveloper) {
      bool flag = true;
      for (int i = 0; i < flutterGroup.length; i++) {
        if (flutterGroup.isEmpty) {
          print("exist not is employee this");
          break;
        }
        if (employee == flutterGroup[i]) {
          flutterGroup.remove(employee);
          allTeamDeveloper.remove(employee);
          print("removed ${employee.name} from flutter group");
          flag = false;
        }
      }
      if (flag) {
        print("this employee is not exist");
      }
    } else if (employee is BackendDeveloper) {
      bool flag = true;
      for (int i = 0; i < backendGroup.length; i++) {
        if (backendGroup.isEmpty) {
          print("exist not is employee this");
          break;
        }
        if (employee == backendGroup[i]) {
          backendGroup.remove(employee);
          allTeamDeveloper.remove(employee);
          print("removed ${employee.name} from backend group");
          flag = false;
        }
      }
      if (flag) {
        print("this employee is not exist");
      }
    } else if (employee is UiUxDeveloper) {
      bool flag = true;
      for (int i = 0; i < uiUxGroup.length; i++) {
        if (uiUxGroup.isEmpty) {
          print("exist not is employee this");
          break;
        }
        if (employee == uiUxGroup[i]) {
          uiUxGroup.remove(employee);
          allTeamDeveloper.remove(employee);
          print("removed ${employee.name} from Ui/Ux group");
          flag = false;
        }
      }
      if (flag) {
        print("this employee is not exist");
      }
    } else {
      print(
          "This employee cannot be removed, the team only has a Flutter and Backend Developer and a UI/UX Developer");
    }
  }

  void addProject(Project project, int teamLeaderId) {
    if (teamLeaderId == teamLeader._id) {
      if (flutterGroup.length >= 2 &&
          backendGroup.length >= 2 &&
          uiUxGroup.length >= 1) {
        if (project.deadline.day < 30) {
          projects.add(project);
        }
      } else {
        print(
            'this team is not complete , The team must contain at least one ui/ux developer, at least 2 flutter developer and at least 2 backend developer');
      }
    } else {
      print(
          "you are not team leader , if you are team leader please enter your correct id ");
    }
  }

  void getAllProjects() {
    int i = 0;
    do {
      if (projects.isEmpty) {
        print("the team doesn't have any project");
      } else {
        print("Project ${i + 1} : ${projects[i]}");
      }
      i++;
    } while (i < projects.length);
  }

  void groupUiFinished(Project project, int teamLeaderId) {
    if (teamLeaderId == teamLeader._id) {
      bool flag = true;
      for (int i = 0; i < projects.length; i++) {
        if (project == projects[i]) {
          project.uiFinished();
          flag = false;
        }
      }
      if (flag) {
        print("this Project is not exist with the team");
      }
    } else {
      print(
          "you are not team leader , if you are team leader please enter your correct id ");
    }
  }

  void groupFlutterFinished(Project project, int teamLeaderId) {
    if (teamLeaderId == teamLeader._id) {
      bool flag = true;
      for (int i = 0; i < projects.length; i++) {
        if (project == projects[i]) {
          project.flutterFinished();
          flag = false;
        }
      }
      if (flag) {
        print("this Project is not exist with the team");
      }
    } else {
      print(
          "you are not team leader , if you are team leader please enter your correct id ");
    }
  }

  void groupBackendFinished(Project project, int teamLeaderId) {
    if (teamLeaderId == teamLeader._id) {
      bool flag = true;
      for (int i = 0; i < projects.length; i++) {
        if (project == projects[i]) {
          project.backendFinished();
          flag = false;
        }
      }
      if (flag) {
        print("this Project is not exist with the team");
      }
    } else {
      print(
          "you are not team leader , if you are team leader please enter your correct id ");
    }
  }
}

class Accountant extends Employee {
  Accountant(
      {required super.name,
      required super.phone,
      required super.address,
      required super.age,
      required super.takeSalaryIsDone,
      required super.hoursWork});

  void calculateSalary(Employee employee, Company company) {
    for (int i = 0; i < company.listOfTeams!.length; i++) {
      for (int j = 0;
          j < company.listOfTeams![i].allTeamDeveloper.length;
          j++) {
        if (employee == company.listOfTeams?[i].allTeamDeveloper[j] &&
            company.accountant == company.listOfTeams![i].allTeamDeveloper[j]) {
          if (employee.hoursWork == 200) {
            employee._salary = employee._salary;
          } else if (employee.hoursWork >= 200) {
            employee._salary =
                (employee._salary + ((employee.hoursWork - 200) * 10));
          } else {
            employee._salary =
                (employee._salary - ((employee.hoursWork - 200) * 10));
          }
        }
      }
    }
  }

  void sendSalary(Employee employee) {
    employee.takeSalaryIsDone = true;
  }

  void addBonusEmployee(int bouns, Employee employee, Company company) {
    employee.setSalaryForEmployee(
        bouns, employee, company.accountant as Company);
    // employee._salary = employee._salary + bouns;
  }

  void minusFromEmployee(int minus, Employee employee, Company company) {
    employee.setSalaryForEmployee(
        minus * -1, employee, company.accountant as Company);
  }
}

class Company {
  String name;
  String address;
  String phone;
  int account;
  Manager manager;
  Accountant accountant;
  List<Team>? listOfTeams = [];
  List<Employee>? listOfEmployee = [];

  Company(this.name, this.address, this.phone, this.account, this.manager,
      this.accountant, this.listOfEmployee, this.listOfTeams);

  bool isEmployeeExist(Employee employee) {
    for (int i = 0; i < listOfEmployee!.length; i++) {
      if (employee == listOfEmployee?[i]) {
        return true;
      }
    }
    return false;
  }

  @override
  String toString() {
    return "Company name : $name, address : $address, phone : $phone, Account : $account, Manager : $manager, accountant : $accountant, listOfTeams : $listOfTeams, listOfEmployee : $listOfEmployee";
  }
}
