import React, { useState } from 'react';
import { useBetween } from "use-between";
import useShareableState from './SharableAudioStates';
import { HiOutlineCloudDownload } from "react-icons/hi";
import { saveAs } from 'file-saver';



import './DownloadRecord.css';


function DownloadRecordButton() {

  const { audioUrl, disableDownload } = useBetween(useShareableState);
  const downLoadAudio = () => {
    console.log(audioUrl)
  }
  const saveFile = () => {
    saveAs(
      audioUrl,
      "record.wav"
    );
  };

  return (
      <button className={`downloadButton
                          ${disableDownload ? "downloadButton_blocked" : "downloadButton_active downloadButton_animation"}`}
              disabled={disableDownload}
              onClick={saveFile}
      >
        <HiOutlineCloudDownload />
      </button>
  );

}

export default DownloadRecordButton;
