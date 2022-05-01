import React, { useState } from 'react';
import AudioReactRecorder, { RecordState } from './AudioRecordCanvas';
import { useBetween } from "use-between";
import useShareableState from './SharableAudioStates';


function Spectogram(){

  const { audioUrl, setAudioUrl, recordState, onStop } = useBetween(useShareableState);

  return (
    <AudioReactRecorder state={recordState} onStop={onStop} />
  );

}





export default Spectogram;
