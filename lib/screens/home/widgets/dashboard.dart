part of 'body.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          _Labels(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const DashDato('INGRESOS'),
                  const DashDato('EGRESOS'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomRadialProgress(
                        porcentaje: 45,
                        colorPrimario: Colors.greenAccent[700],
                        colorSecundario: Colors.redAccent,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Column(
                            children: [
                              _ColorLabel('Ingresos', color: Colors.greenAccent[700], small: true),
                              const Text('\$45,000.0', style: TextStyle(fontWeight: FontWeight.w200)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: const [
                              _ColorLabel('Egresos', color: Colors.redAccent, small: true),
                              Text('\$55,000.0', style: TextStyle(fontWeight: FontWeight.w200)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 135),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ColorLabel('Actual', color: Theme.of(context).primaryColor),
          _ColorLabel('Pasado', color: Theme.of(context).colorScheme.secondary),
        ],
      ),
    );
  }
}

class _ColorLabel extends StatelessWidget {
  final String label;
  final Color? color;
  final bool small;

  const _ColorLabel(
    this.label, {
    required this.color,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: small ? 18 : 33,
          height: small ? 18 : 33,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(small ? 5 : 10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: Theme.of(context).hintColor,
              ),
            ],
          ),
        ),
        const SizedBox(width: 7.5),
        Text(
          label,
          style: TextStyle(fontSize: small ? 17 : 20, color: Theme.of(context).hintColor),
        ),
      ],
    );
  }
}
