
module.exports = function(contentType, data,opts,next){
  try {
    next(null, (typeof data === 'string' ? data : JSON.stringify(data)));
  } catch(er){
    next(er.message || er);
  }
}
