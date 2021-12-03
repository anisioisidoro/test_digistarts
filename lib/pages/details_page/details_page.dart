import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_digistarts/module/service/service_locator.dart';
import 'package:test_digistarts/store/covid_store/covid_store.dart';
import 'package:test_digistarts/utils/global_const.dart';
import 'package:test_digistarts/utils/theme.dart';

class DetailsPage extends StatefulWidget {
  final String state;

  const DetailsPage({Key? key, required this.state}) : super(key: key);
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late CovidStore _covidStore;
  @override
  void initState() {
    _covidStore = locator.get<CovidStore>();

    _covidStore.searchCases(state: widget.state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      if (_covidStore.isloadingCase) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (_covidStore.cases.length < 0) {
        return Center(
          child: Text("There is content to be shown"),
        );
      }

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: verifyScreenSize(context)?50:0, vertical: verifyScreenSize(context)?10:0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                 childAspectRatio: verifyScreenSize(context) ? 2 : 0.5,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            itemCount: _covidStore.cases.length,
            itemBuilder: (context, index) {
              var cases = _covidStore.cases[index];

              return Card(
                  color: Colors.grey[300],
                  elevation: 8.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    height: 200,
                    width: 350,
                    child: Column(
                      children: [
                        
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Death: ${cases.deaths}",
                            style: regular16pt.copyWith(color: Colors.red),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Confirmed: ${cases.confirmed}",
                            style: regular16pt.copyWith(color: Colors.orange),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Date: ${cases.date}",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
      );
    }));
  }
}
