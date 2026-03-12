// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_itinerary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TripItineraryModel _$TripItineraryModelFromJson(Map<String, dynamic> json) {
  return _TripItineraryModel.fromJson(json);
}

/// @nodoc
mixin _$TripItineraryModel {
  String get destination => throw _privateConstructorUsedError;
  String get budget => throw _privateConstructorUsedError;
  int get durationDays => throw _privateConstructorUsedError;
  List<DayItineraryModel> get days => throw _privateConstructorUsedError;

  /// Serializes this TripItineraryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TripItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripItineraryModelCopyWith<TripItineraryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripItineraryModelCopyWith<$Res> {
  factory $TripItineraryModelCopyWith(
    TripItineraryModel value,
    $Res Function(TripItineraryModel) then,
  ) = _$TripItineraryModelCopyWithImpl<$Res, TripItineraryModel>;
  @useResult
  $Res call({
    String destination,
    String budget,
    int durationDays,
    List<DayItineraryModel> days,
  });
}

/// @nodoc
class _$TripItineraryModelCopyWithImpl<$Res, $Val extends TripItineraryModel>
    implements $TripItineraryModelCopyWith<$Res> {
  _$TripItineraryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
    Object? budget = null,
    Object? durationDays = null,
    Object? days = null,
  }) {
    return _then(
      _value.copyWith(
            destination: null == destination
                ? _value.destination
                : destination // ignore: cast_nullable_to_non_nullable
                      as String,
            budget: null == budget
                ? _value.budget
                : budget // ignore: cast_nullable_to_non_nullable
                      as String,
            durationDays: null == durationDays
                ? _value.durationDays
                : durationDays // ignore: cast_nullable_to_non_nullable
                      as int,
            days: null == days
                ? _value.days
                : days // ignore: cast_nullable_to_non_nullable
                      as List<DayItineraryModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TripItineraryModelImplCopyWith<$Res>
    implements $TripItineraryModelCopyWith<$Res> {
  factory _$$TripItineraryModelImplCopyWith(
    _$TripItineraryModelImpl value,
    $Res Function(_$TripItineraryModelImpl) then,
  ) = __$$TripItineraryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String destination,
    String budget,
    int durationDays,
    List<DayItineraryModel> days,
  });
}

/// @nodoc
class __$$TripItineraryModelImplCopyWithImpl<$Res>
    extends _$TripItineraryModelCopyWithImpl<$Res, _$TripItineraryModelImpl>
    implements _$$TripItineraryModelImplCopyWith<$Res> {
  __$$TripItineraryModelImplCopyWithImpl(
    _$TripItineraryModelImpl _value,
    $Res Function(_$TripItineraryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TripItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
    Object? budget = null,
    Object? durationDays = null,
    Object? days = null,
  }) {
    return _then(
      _$TripItineraryModelImpl(
        destination: null == destination
            ? _value.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as String,
        budget: null == budget
            ? _value.budget
            : budget // ignore: cast_nullable_to_non_nullable
                  as String,
        durationDays: null == durationDays
            ? _value.durationDays
            : durationDays // ignore: cast_nullable_to_non_nullable
                  as int,
        days: null == days
            ? _value._days
            : days // ignore: cast_nullable_to_non_nullable
                  as List<DayItineraryModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TripItineraryModelImpl implements _TripItineraryModel {
  const _$TripItineraryModelImpl({
    required this.destination,
    required this.budget,
    required this.durationDays,
    required final List<DayItineraryModel> days,
  }) : _days = days;

  factory _$TripItineraryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripItineraryModelImplFromJson(json);

  @override
  final String destination;
  @override
  final String budget;
  @override
  final int durationDays;
  final List<DayItineraryModel> _days;
  @override
  List<DayItineraryModel> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'TripItineraryModel(destination: $destination, budget: $budget, durationDays: $durationDays, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripItineraryModelImpl &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    destination,
    budget,
    durationDays,
    const DeepCollectionEquality().hash(_days),
  );

  /// Create a copy of TripItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripItineraryModelImplCopyWith<_$TripItineraryModelImpl> get copyWith =>
      __$$TripItineraryModelImplCopyWithImpl<_$TripItineraryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TripItineraryModelImplToJson(this);
  }
}

abstract class _TripItineraryModel implements TripItineraryModel {
  const factory _TripItineraryModel({
    required final String destination,
    required final String budget,
    required final int durationDays,
    required final List<DayItineraryModel> days,
  }) = _$TripItineraryModelImpl;

  factory _TripItineraryModel.fromJson(Map<String, dynamic> json) =
      _$TripItineraryModelImpl.fromJson;

  @override
  String get destination;
  @override
  String get budget;
  @override
  int get durationDays;
  @override
  List<DayItineraryModel> get days;

  /// Create a copy of TripItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripItineraryModelImplCopyWith<_$TripItineraryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DayItineraryModel _$DayItineraryModelFromJson(Map<String, dynamic> json) {
  return _DayItineraryModel.fromJson(json);
}

/// @nodoc
mixin _$DayItineraryModel {
  String get dayTitle => throw _privateConstructorUsedError;
  List<ActivityModel> get activities => throw _privateConstructorUsedError;

  /// Serializes this DayItineraryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayItineraryModelCopyWith<DayItineraryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayItineraryModelCopyWith<$Res> {
  factory $DayItineraryModelCopyWith(
    DayItineraryModel value,
    $Res Function(DayItineraryModel) then,
  ) = _$DayItineraryModelCopyWithImpl<$Res, DayItineraryModel>;
  @useResult
  $Res call({String dayTitle, List<ActivityModel> activities});
}

/// @nodoc
class _$DayItineraryModelCopyWithImpl<$Res, $Val extends DayItineraryModel>
    implements $DayItineraryModelCopyWith<$Res> {
  _$DayItineraryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dayTitle = null, Object? activities = null}) {
    return _then(
      _value.copyWith(
            dayTitle: null == dayTitle
                ? _value.dayTitle
                : dayTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            activities: null == activities
                ? _value.activities
                : activities // ignore: cast_nullable_to_non_nullable
                      as List<ActivityModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DayItineraryModelImplCopyWith<$Res>
    implements $DayItineraryModelCopyWith<$Res> {
  factory _$$DayItineraryModelImplCopyWith(
    _$DayItineraryModelImpl value,
    $Res Function(_$DayItineraryModelImpl) then,
  ) = __$$DayItineraryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dayTitle, List<ActivityModel> activities});
}

/// @nodoc
class __$$DayItineraryModelImplCopyWithImpl<$Res>
    extends _$DayItineraryModelCopyWithImpl<$Res, _$DayItineraryModelImpl>
    implements _$$DayItineraryModelImplCopyWith<$Res> {
  __$$DayItineraryModelImplCopyWithImpl(
    _$DayItineraryModelImpl _value,
    $Res Function(_$DayItineraryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dayTitle = null, Object? activities = null}) {
    return _then(
      _$DayItineraryModelImpl(
        dayTitle: null == dayTitle
            ? _value.dayTitle
            : dayTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        activities: null == activities
            ? _value._activities
            : activities // ignore: cast_nullable_to_non_nullable
                  as List<ActivityModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DayItineraryModelImpl implements _DayItineraryModel {
  const _$DayItineraryModelImpl({
    required this.dayTitle,
    required final List<ActivityModel> activities,
  }) : _activities = activities;

  factory _$DayItineraryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayItineraryModelImplFromJson(json);

  @override
  final String dayTitle;
  final List<ActivityModel> _activities;
  @override
  List<ActivityModel> get activities {
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activities);
  }

  @override
  String toString() {
    return 'DayItineraryModel(dayTitle: $dayTitle, activities: $activities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayItineraryModelImpl &&
            (identical(other.dayTitle, dayTitle) ||
                other.dayTitle == dayTitle) &&
            const DeepCollectionEquality().equals(
              other._activities,
              _activities,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dayTitle,
    const DeepCollectionEquality().hash(_activities),
  );

  /// Create a copy of DayItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayItineraryModelImplCopyWith<_$DayItineraryModelImpl> get copyWith =>
      __$$DayItineraryModelImplCopyWithImpl<_$DayItineraryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DayItineraryModelImplToJson(this);
  }
}

abstract class _DayItineraryModel implements DayItineraryModel {
  const factory _DayItineraryModel({
    required final String dayTitle,
    required final List<ActivityModel> activities,
  }) = _$DayItineraryModelImpl;

  factory _DayItineraryModel.fromJson(Map<String, dynamic> json) =
      _$DayItineraryModelImpl.fromJson;

  @override
  String get dayTitle;
  @override
  List<ActivityModel> get activities;

  /// Create a copy of DayItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayItineraryModelImplCopyWith<_$DayItineraryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) {
  return _ActivityModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityModel {
  String get time => throw _privateConstructorUsedError; // e.g. "10:00 AM"
  String get title =>
      throw _privateConstructorUsedError; // e.g. "Visit Eiffel Tower"
  String get description => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  bool get isBooked => throw _privateConstructorUsedError;

  /// Serializes this ActivityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityModelCopyWith<ActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityModelCopyWith<$Res> {
  factory $ActivityModelCopyWith(
    ActivityModel value,
    $Res Function(ActivityModel) then,
  ) = _$ActivityModelCopyWithImpl<$Res, ActivityModel>;
  @useResult
  $Res call({
    String time,
    String title,
    String description,
    String location,
    bool isBooked,
  });
}

/// @nodoc
class _$ActivityModelCopyWithImpl<$Res, $Val extends ActivityModel>
    implements $ActivityModelCopyWith<$Res> {
  _$ActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? title = null,
    Object? description = null,
    Object? location = null,
    Object? isBooked = null,
  }) {
    return _then(
      _value.copyWith(
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            isBooked: null == isBooked
                ? _value.isBooked
                : isBooked // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ActivityModelImplCopyWith<$Res>
    implements $ActivityModelCopyWith<$Res> {
  factory _$$ActivityModelImplCopyWith(
    _$ActivityModelImpl value,
    $Res Function(_$ActivityModelImpl) then,
  ) = __$$ActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String time,
    String title,
    String description,
    String location,
    bool isBooked,
  });
}

/// @nodoc
class __$$ActivityModelImplCopyWithImpl<$Res>
    extends _$ActivityModelCopyWithImpl<$Res, _$ActivityModelImpl>
    implements _$$ActivityModelImplCopyWith<$Res> {
  __$$ActivityModelImplCopyWithImpl(
    _$ActivityModelImpl _value,
    $Res Function(_$ActivityModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? title = null,
    Object? description = null,
    Object? location = null,
    Object? isBooked = null,
  }) {
    return _then(
      _$ActivityModelImpl(
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        isBooked: null == isBooked
            ? _value.isBooked
            : isBooked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityModelImpl implements _ActivityModel {
  const _$ActivityModelImpl({
    required this.time,
    required this.title,
    required this.description,
    required this.location,
    this.isBooked = false,
  });

  factory _$ActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityModelImplFromJson(json);

  @override
  final String time;
  // e.g. "10:00 AM"
  @override
  final String title;
  // e.g. "Visit Eiffel Tower"
  @override
  final String description;
  @override
  final String location;
  @override
  @JsonKey()
  final bool isBooked;

  @override
  String toString() {
    return 'ActivityModel(time: $time, title: $title, description: $description, location: $location, isBooked: $isBooked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityModelImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isBooked, isBooked) ||
                other.isBooked == isBooked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, title, description, location, isBooked);

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityModelImplCopyWith<_$ActivityModelImpl> get copyWith =>
      __$$ActivityModelImplCopyWithImpl<_$ActivityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityModelImplToJson(this);
  }
}

abstract class _ActivityModel implements ActivityModel {
  const factory _ActivityModel({
    required final String time,
    required final String title,
    required final String description,
    required final String location,
    final bool isBooked,
  }) = _$ActivityModelImpl;

  factory _ActivityModel.fromJson(Map<String, dynamic> json) =
      _$ActivityModelImpl.fromJson;

  @override
  String get time; // e.g. "10:00 AM"
  @override
  String get title; // e.g. "Visit Eiffel Tower"
  @override
  String get description;
  @override
  String get location;
  @override
  bool get isBooked;

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityModelImplCopyWith<_$ActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
