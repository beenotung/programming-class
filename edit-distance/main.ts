import {editDistance} from "./edit-distance";

const a = 'Tibetan Meditation Music, Relaxing Music, Calming Music, Stress Relief Music, Peaceful Music, ☯3258 (128kbit_AAC).m4a';
const b = '犬夜叉_InuYasha_이누야샤_哀伤_SAD MUSIC (192kbit_AAC).m4a';
const d = editDistance(a, b);
console.log({a, b, d});
