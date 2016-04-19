if (sideMissionUp) true
{
		"sideMarker" setMarkerPosLocal (getPos sideObj);
		"sideCircle" setMarkerPosLocal (getPos sideObj);
		"sideMarker" setMarkerTextLocal format["Side Mission: %1",sideMarkerText];
} else {
		"sideMarker" setMarkerPosLocal [0,0,0];
		"sideCircle" setMarkerPosLocal [0,0,0];
		"sideMarker" setMarkerTextLocal "NONE";
};
