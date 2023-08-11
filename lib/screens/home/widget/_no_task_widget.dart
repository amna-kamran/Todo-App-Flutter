part of 'task_list.dart';

class _NoTasksWidget extends StatelessWidget {
  const _NoTasksWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.notesSvg,
          color: CustomColors.accent,
        ),
        Spaces.h20,
        const Text(
          'No tasks here yet',
          style: TextStyle(
            color: Color.fromARGB(255, 58, 58, 58),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
