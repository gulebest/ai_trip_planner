// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TripRequestModel _$TripRequestModelFromJson(Map<String, dynamic> json) {
  return _TripRequestModel.fromJson(json);
}

/// @nodoc
mixin _$TripRequestModel {
  String get destination => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get budget =>
      throw _privateConstructorUsedError; // Low, Medium, High, Luxury
  List<String> get interests =>
      throw _privateConstructorUsedError; // food, history, nature
  int get travelers => throw _privateConstructorUsedError;

  /// Serializes this TripRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TripRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripRequestModelCopyWith<TripRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripRequestModelCopyWith<$Res> {
  factory $TripRequestModelCopyWith(
    TripRequestModel value,
    $Res Function(TripRequestModel) then,
  ) = _$TripRequestModelCopyWithImpl<$Res, TripRequestModel>;
  @useResult
  $Res call({
    String destination,
    DateTime startDate,
    DateTime endDate,
    String budget,
    List<String> interests,
    int travelers,
  });
}

/// @nodoc
class _$TripRequestModelCopyWithImpl<$Res, $Val extends TripRequestModel>
    implements $TripRequestModelCopyWith<$Res> {
  _$TripRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? budget = null,
    Object? interests = null,
    Object? travelers = null,
  }) {
    return _then(
      _value.copyWith(
            destination: null == destination
                ? _value.destination
                : destination // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            budget: null == budget
                ? _value.budget
                : budget // ignore: cast_nullable_to_non_nullable
                      as String,
            interests: null == interests
                ? _value.interests
                : interests // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            travelers: null == travelers
                ? _value.travelers
                : travelers // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TripRequestModelImplCopyWith<$Res>
    implements $TripRequestModelCopyWith<$Res> {
  factory _$$TripRequestModelImplCopyWith(
    _$TripRequestModelImpl value,
    $Res Function(_$TripRequestModelImpl) then,
  ) = __$$TripRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String destination,
    DateTime startDate,
    DateTime endDate,
    String budget,
    List<String> interests,
    int travelers,
  });
}

/// @nodoc
class __$$TripRequestModelImplCopyWithImpl<$Res>
    extends _$TripRequestModelCopyWithImpl<$Res, _$TripRequestModelImpl>
    implements _$$TripRequestModelImplCopyWith<$Res> {
  __$$TripRequestModelImplCopyWithImpl(
    _$TripRequestModelImpl _value,
    $Res Function(_$TripRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TripRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? budget = null,
    Object? interests = null,
    Object? travelers = null,
  }) {
    return _then(
      _$TripRequestModelImpl(
        destination: null == destination
            ? _value.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        budget: null == budget
            ? _value.budget
            : budget // ignore: cast_nullable_to_non_nullable
                  as String,
        interests: null == interests
            ? _value._interests
            : interests // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        travelers: null == travelers
            ? _value.travelers
            : travelers // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TripRequestModelImpl implements _TripRequestModel {
  const _$TripRequestModelImpl({
    required this.destination,
    required this.startDate,
    required this.endDate,
    this.budget = 'Medium',
    final List<String> interests = const [],
    this.travelers = 1,
  }) : _interests = interests;

  factory _$TripRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripRequestModelImplFromJson(json);

  @override
  final String destination;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  @JsonKey()
  final String budget;
  // Low, Medium, High, Luxury
  final List<String> _interests;
  // Low, Medium, High, Luxury
  @override
  @JsonKey()
  List<String> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  // food, history, nature
  @override
  @JsonKey()
  final int travelers;

  @override
  String toString() {
    return 'TripRequestModel(destination: $destination, startDate: $startDate, endDate: $endDate, budget: $budget, interests: $interests, travelers: $travelers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripRequestModelImpl &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            const DeepCollectionEquality().equals(
              other._interests,
              _interests,
            ) &&
            (identical(other.travelers, travelers) ||
                other.travelers == travelers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    destination,
    startDate,
    endDate,
    budget,
    const DeepCollectionEquality().hash(_interests),
    travelers,
  );

  /// Create a copy of TripRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripRequestModelImplCopyWith<_$TripRequestModelImpl> get copyWith =>
      __$$TripRequestModelImplCopyWithImpl<_$TripRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TripRequestModelImplToJson(this);
  }
}

abstract class _TripRequestModel implements TripRequestModel {
  const factory _TripRequestModel({
    required final String destination,
    required final DateTime startDate,
    required final DateTime endDate,
    final String budget,
    final List<String> interests,
    final int travelers,
  }) = _$TripRequestModelImpl;

  factory _TripRequestModel.fromJson(Map<String, dynamic> json) =
      _$TripRequestModelImpl.fromJson;

  @override
  String get destination;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get budget; // Low, Medium, High, Luxury
  @override
  List<String> get interests; // food, history, nature
  @override
  int get travelers;

  /// Create a copy of TripRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripRequestModelImplCopyWith<_$TripRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
