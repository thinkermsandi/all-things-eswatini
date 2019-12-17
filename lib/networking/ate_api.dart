import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class ATEApi {
  final Client client;

  ATEApi(this.client);

  Uri get weatherBaseUrl => Uri.https('allthingseswatini.rationalthinkers.co.za', '/weather');
  Uri get newsBaseUrl => Uri.https('allthingseswatini.rationalthinkers.co.za', '/news');
  Uri get tvBaseUrl => Uri.https('allthingseswatini.rationalthinkers.co.za', '/tv');
  Uri get appsBaseUrl => Uri.https('allthingseswatini.rationalthinkers.co.za', '/apps');
  Uri get jobsBaseUrl => Uri.https('allthingseswatini.rationalthinkers.co.za', '/jobs');

}

/*
initStores() async {
  //Fetch items from API
}*/