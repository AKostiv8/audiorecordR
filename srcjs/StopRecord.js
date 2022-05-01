import React, { useState } from 'react';
import { useBetween } from "use-between";
import useShareableState from './SharableAudioStates';
import { FaStop } from "react-icons/fa";

import './StopRecord.css';


function StopRecordButton() {

  const { disableStop, stop } = useBetween(useShareableState);

  return (
      <button className={`stopButton
                          ${disableStop ? "stopButton_blocked" : "stopButton_active"}
                         `}
              disabled={disableStop}
              onClick={stop}
      >
        <FaStop />
      </button>
  );

}

export default StopRecordButton;
