import '../_core_exports.dart';

class CustomMessenger extends StatelessWidget {
  const CustomMessenger({Key? key, required this.state, required this.content})
      : super(key: key);
  final CustomMessengerState state;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(.1),
          ),
        ],
        border: Border.all(
          color: state.getColor(),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Icon(state.getIcon(), color: state.getColor(), size: 32),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
