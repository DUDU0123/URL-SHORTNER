import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/core/utils/message_show_helper.dart';
import 'package:url_shortner/features/url_shortner_home/domain/usecase/url_shorten_usecase.dart';
part 'url_shortner_event.dart';
part 'url_shortner_state.dart';

class UrlShortnerBloc extends Bloc<UrlShortnerEvent, UrlShortnerState> {
  final UrlShortenUsecase _urlShortenUsecase;
  UrlShortnerBloc({
    required UrlShortenUsecase urlShortenUsecase,
  })  : _urlShortenUsecase = urlShortenUsecase,
        super(UrlShortnerInitial()) {
    on<ShortenUrlEvent>(shortenUrlEvent);
    on<CopyToClipBoardEvent>(copyToClipBoardEvent);
  }

  FutureOr<void> shortenUrlEvent(
      ShortenUrlEvent event, Emitter<UrlShortnerState> emit) async {
    try {
      final url = event.urlForShorten;
      final res = await _urlShortenUsecase(params: url);
      res.fold(
        (failure) {
          emit(UrlShortenErrorState(message: failure.message));
        },
        (shortenUrlModel) {
          if (shortenUrlModel.shortenUrl != null) {
            if (shortenUrlModel.shortenUrl!.isNotEmpty) {
              emit(UrlShortenSuccessState(
                  shortenUrl: shortenUrlModel.shortenUrl!));
            } else {
              emit(
                const UrlShortenErrorState(
                    message: "Sorry, can't generate shorten url for this"),
              );
            }
          } else {
            emit(
              const UrlShortenErrorState(
                  message: "Sorry, can't generate shorten url for this"),
            );
          }
        },
      );
    } catch (e) {
      emit(UrlShortenErrorState(message: e.toString()));
    }
  }

  FutureOr<void> copyToClipBoardEvent(
      CopyToClipBoardEvent event, Emitter<UrlShortnerState> emit) {
    try {
      Clipboard.setData(
        ClipboardData(text: event.shortenUrl),
      );
      MessageShowhelper.showSnackbar(
        snackBarContent: "url copied to clipboard",
      );
    } catch (e) {
      emit(UrlShortenErrorState(message: e.toString()));
    }
  }
}
