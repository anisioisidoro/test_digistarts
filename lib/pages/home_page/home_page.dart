import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_digistarts/module/service/service_locator.dart';
import 'package:test_digistarts/pages/details_page/details_page.dart';
import 'package:test_digistarts/store/covid_store/covid_store.dart';
import 'package:test_digistarts/utils/theme.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CovidStore _covidStore;

  @override
  void initState() {
    _covidStore = locator.get<CovidStore>();

    _covidStore.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      if (_covidStore.isloadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (_covidStore.states.length < 0) {
        return Center(
          child: Text("There is content to be shown"),
        );
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            itemCount: _covidStore.states.length,
            itemBuilder: (context, index) {
              var state = _covidStore.states[index];
              return GestureDetector(
                child: Card(
                    color: Colors.grey[300],
                    elevation: 8.0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      height: 200,
                      width: 350,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "State: $state",
                            style: heading6.copyWith(color: primaryBlue),
                          ),
                        ),
                      ),
                    )),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(state: state))),
              );
            }),
      );
    }));
  }
}
