import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

class ModalDialogsPage extends StatelessWidget {
  Widget _renderBlock(Widget child) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.white,
          child: child,
        ),
      ),
    );
  }

  Widget _renderHeader(String title) {
    return Container(
      height: 48,
      padding: EdgeInsets.only(left: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      name: 'ModalDialogs',
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      body: ListView(
        children: [
          _renderBlock(Column(
            children: [
              _renderHeader('ModalDialog'),
              ModalDialogSample(),
              SizedBox(height: 16),
            ],
          )),
        ],
      ),
    );
  }
}

class ModalDialogSample extends StatefulWidget {
  @override
  _ModalDialogSampleState createState() => _ModalDialogSampleState();
}

class _ModalDialogSampleState extends State<ModalDialogSample> {
  Color color = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.pink,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            showMPDialog(
              context: context,
              barrierColor: Colors.black.withOpacity(0.5),
              barrierDismissible: true,
              builder: (context) {
                return MPScaffold(
                  body: Align(
                    alignment: Alignment.bottomCenter,
                    child: AbsorbPointer(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/container');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            width: 50,
            height: 50,
            color: color,
          ),
        ),
      ),
    );
  }
}
