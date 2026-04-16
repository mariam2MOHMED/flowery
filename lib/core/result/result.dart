sealed class Result<t>{}
class SuccessResult<T> extends Result<T>{
  T data;
  SuccessResult(this.data);
}
class FailedResult<T> extends Result<T>{
 String error;
  FailedResult(this.error);
}