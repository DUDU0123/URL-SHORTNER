import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/core/constants/height_width.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/bloc/bloc/url_shortner_bloc.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/utils/url_shortner_container_decoration.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/widgets/shorten_url_show_widget.dart';
import 'package:url_shortner/features/url_shortner_home/presentation/widgets/url_shortner_container_widget.dart';

class UrlShortnerHome extends StatelessWidget {
  const UrlShortnerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: commonContainerDecoration().copyWith(
          borderRadius: const BorderRadius.all(Radius.zero),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
            colors: [
              Color.fromARGB(255, 218, 177, 244),
              Color.fromARGB(255, 75, 88, 234),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: BlocBuilder<UrlShortnerBloc, UrlShortnerState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       if(state is UrlShortenSuccessState)shortenUrlShowWidget(shortenUrl: state.shortenUrl),
                        kHeight20,
                        const UrlShortnerContainerWidget(),
                      ],
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
