function path(o, ps){
	for (let p of ps.split(".")){
		if (o && ((o.hasOwnProperty &&  o.hasOwnProperty(p)) || (!o.hasOwnProperty && o[p]))){
			o = o[p];
		} else {
			return undefined;
		}
	}
	return o;
}

const clamp = (v, min, max) => {
	if (v == undefined || v < min) v = min;
	return max < v ? max : v;
}

const sameday = (d1, d2) => {
  if (!(d1 instanceof Date) || !(d2 instanceof Date)) return false;
  return (d1.getDate() === d2.getDate() && d1.getMonth() === d2.getMonth() && d1.getYear() === d2.getYear());
}



export { path, clamp, sameday }