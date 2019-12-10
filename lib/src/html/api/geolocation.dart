// Copyright 2019 terrier989@gmail.com
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
/*
Some source code in this file was adopted from 'dart:html' in Dart SDK. See:
  https://github.com/dart-lang/sdk/tree/master/tools/dom

The source code adopted from 'dart:html' had the following license:

  Copyright 2012, the Dart project authors. All rights reserved.
  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of Google Inc. nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

part of universal_html.internal;

class Coordinates {
  final num accuracy;
  final num altitude;
  final num altitudeAccuracy;
  final num heading;
  final num latitude;
  final num longitude;
  final num speed;

  const Coordinates._({
    this.accuracy = 0.0,
    this.altitude = 0.0,
    this.altitudeAccuracy = 0.0,
    this.heading = 0.0,
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.speed = 0.0,
  });
}

class Geolocation {
  final Geoposition _geoPosition;

  Geolocation._({Geoposition geoposition})
      : this._geoPosition = geoposition ?? Geoposition._();

  Future<Geoposition> getCurrentPosition(
      {bool enableHighAccuracy, Duration timeout, Duration maximumAge}) {
    return Future<Geoposition>.value(_geoPosition);
  }

  Stream<Geoposition> watchPosition(
      {bool enableHighAccuracy, Duration timeout, Duration maximumAge}) {
    return Stream<Geoposition>.fromIterable(<Geoposition>[_geoPosition]);
  }
}

class Geoposition {
  final Coordinates coords;

  final int timestamp;

  /// IMPORTANT: Not part 'dart:html'.
  Geoposition._({Coordinates coords, int timestamp})
      : this.coords = coords ?? const Coordinates._(),
        this.timestamp = timestamp ?? DateTime.now().millisecondsSinceEpoch;
}

class PositionError extends Error {
  final int code;
  final String message;
  PositionError._(this.code, this.message);
}
