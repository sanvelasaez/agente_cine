import 'package:agente_cine/infrastructure/mappers/cast_mapper.dart';
import 'package:agente_cine/infrastructure/models/cast_member_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CastMapper', () {
    test('should convert CastMemberDto to CastMember entity', () {
      // Arrange
      const castDto = CastMemberDto(
        id: 819,
        name: 'Edward Norton',
        character: 'The Narrator',
        profilePath: '/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg',
        order: 0,
      );

      // Act
      final castMember = castDto.toEntity();

      // Assert
      expect(castMember.id, 819);
      expect(castMember.name, 'Edward Norton');
      expect(castMember.character, 'The Narrator');
      expect(castMember.profilePath, '/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg');
      expect(castMember.order, 0);
    });

    test('should handle null profilePath', () {
      // Arrange
      const castDto = CastMemberDto(
        id: 819,
        name: 'Edward Norton',
        character: 'The Narrator',
        order: 0,
      );

      // Act
      final castMember = castDto.toEntity();

      // Assert
      expect(castMember.id, 819);
      expect(castMember.profilePath, null);
    });

    test('should convert list of CastMemberDtos', () {
      // Arrange
      const castList = [
        CastMemberDto(
          id: 819,
          name: 'Edward Norton',
          character: 'The Narrator',
          order: 0,
        ),
        CastMemberDto(
          id: 287,
          name: 'Brad Pitt',
          character: 'Tyler Durden',
          order: 1,
        ),
      ];

      // Act
      final entities = castList.map((dto) => dto.toEntity()).toList();

      // Assert
      expect(entities.length, 2);
      expect(entities[0].name, 'Edward Norton');
      expect(entities[1].name, 'Brad Pitt');
      expect(entities[0].order, 0);
      expect(entities[1].order, 1);
    });
  });
}
