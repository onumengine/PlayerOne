import 'package:flutter/material.dart';
import 'package:player_one/core/theming/colors.dart';

class LastPlayedCard extends StatelessWidget {
  final String? path1, path2, path3, title, subtitle;

  const LastPlayedCard({
    Key? key,
    this.path1,
    this.path2,
    this.path3,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: SizedBox(
          height: constraints.maxHeight,
          width: MediaQuery.of(context).size.width / 2.3,
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight / 1.6,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        //width: /* constraints.maxWidth / 2 */ 30,
                        height: constraints.maxHeight / 1.6,
                        child: Image.asset(
                          path1!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                path2!,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                path3!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 26, 12),
                  width: constraints.maxWidth,
                  color: AppColors.text.withOpacity(0.1),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 16 / 14,
                              color: AppColors.text,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            subtitle!,
                            style: const TextStyle(
                              fontSize: 12,
                              height: 14 / 12,
                              color: AppColors.subtitle,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
