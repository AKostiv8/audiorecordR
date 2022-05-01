import { reactWidget } from 'reactR';
import Spectogram from './Spectogram.js';
import StartRecordButton from './StartRecord.js';
import StopRecordButton from './StopRecord.js';
import DownloadRecordButton from './DownloadRecord.js';
import PlayRecordButton from './PlayRecord.js';


reactWidget('AudioReactRecorder', 'output', {
  AudioReactRecorderCustom: Spectogram
});
reactWidget('StartRecord', 'output', {
  StartRecordCustom: StartRecordButton
});
reactWidget('StopRecord', 'output', {
  StopRecordCustom: StopRecordButton
});
reactWidget('DownloadRecord', 'output', {
  DownloadRecordCustom: DownloadRecordButton
});
reactWidget('PlayRecord', 'output', {
  PlayRecordCustom: PlayRecordButton
});
