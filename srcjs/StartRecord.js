import React, { useState } from 'react';
import { useBetween } from "use-between";
import useShareableState from './SharableAudioStates';
import { FaMicrophone } from "react-icons/fa";

import './StartRecord.css';


function StartRecordButton() {

  const { start, isActive, playRecord } = useBetween(useShareableState);

  return (
      <button className={`pulseButton pulseButton_active
                          ${isActive ? "pulseButton_animation" : ""}
                          ${playRecord ? "pulseButton_blocked" : ""}
                         `}
              onClick={start}
              disabled={playRecord}
      >
          <FaMicrophone />
      </button>
  );

}

export default StartRecordButton;
