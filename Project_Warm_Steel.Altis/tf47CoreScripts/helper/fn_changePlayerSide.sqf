



_units = [_this select 0];
_side = _this select 1;

if (count _units > 0) then
{
	// Save the names of each group that the original units belonged to.
	_groupNames = []; // List of the groups that must be created on the new side
	_unitGroupIndexes = []; // Index in _groupNames for the group each _units entry should go to
	{
		_currentUnitGroupName = groupId (group _x);
		if (_currentUnitGroupName in _groupNames) then
		{
			_indexOfGroupName = 0;
			{
				if (_x == _currentUnitGroupName) exitWith { _unitGroupIndexes pushBack _forEachIndex; };
			} forEach _groupNames;
		}
		else
		{
			_unitGroupIndexes pushBack (count _groupNames);
			_groupNames pushBack _currentUnitGroupName;
		};
	} forEach _units;
	
	// Create the new set of groups on the new side with matching names
	_newGroups = [];
	{
		_newGroup = createGroup _side;
		_newGroup setGroupId [(_groupNames select _forEachIndex)];
		_newGroups pushBack _newGroup;
	} forEach _groupNames;

	// Assign each unit into their original group
	{
		_newGroupIndex = (_unitGroupIndexes select _forEachIndex);
		_newGroup = _newGroups select _newGroupIndex;
		[_x] join _newGroup;
	} forEach _units;
	//hint format ["Changed side for %1 players.", count _units];
};