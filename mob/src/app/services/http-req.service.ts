import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class HttpReqService {

  baseUrl = 'http://localhost/pos/svr/';

  constructor(private http: HttpClient,) { }

  async httpReq(type, param) {
    const url = this.baseUrl + param.endPoint;
    try {
      const successRes = await this.http.request(type, url, { params: param.data }).toPromise();
      
      if (successRes !== null) {
        return this.successResVal(type, url, param, successRes);
      } else {
        return 'null res';
      }
    } catch (err) {
      // console.log(err);
      // this.audit.err('api server issue+' + JSON.stringify(err), 'http-req.service.ts', 38);
      // const error =  this.errorResVal(type, url, param, err);
      return err;
    }
  }

  successResVal(type, url, param, data) {
    if (data.success === true && data.status === true) {
      // this.audit.info(['data', data]);
      return data;
    // } else if (
    //   data.success === true && data.status === false
    // ) {
    //   //this.alerts.errResMsg(data.details);
    //   this.alerts.otherErr(type, url, param, data);
    //   return;
    } else if (
      data.success === true && data.status === false &&
      data.details === 'Unotherized access attempt'
    ) {
      // this.audit.warning(['reject(access)', 'data.details', data.details]);
      // this.audit.warning(JSON.stringify(data.details), 'http-req.service.ts', 74 );
      // this.alerts.errResMsg(data.details);
      return;
    // } else if (
    //   data.success === true && data.status === false &&
    //   data.details.code === 'err_invalid_license'
    // ) {
      // this.audit.warning(['reject(access)', 'data.details', data.details]);
      // this.audit.warning(JSON.stringify(data.details), 'http-req.service.ts', 82 );
      // this.alerts.errResMsg(data.details);
      // return 'err_invalid_license';
    // } else if (data.success === true && data.status === false) {
    //   // this.audit.warning(['reject(access)', 'data.details', data.details]);
    //   this.audit.warning(JSON.stringify(data.details), 'http-req.service.ts', 87 );
    //   this.alerts.errResMsg(data.details);
    }  else {
      // this.audit.err(['reject(other)', 'data.details', data.details]);
      // this.audit.warning('type:' + type + 'url:' + url + 'param:' + param + 'data:' + JSON.stringify(data), 'http-req.service.ts', 91 );
      // this.alerts.otherErr(type, url, param, data);
      return;
    }
  }
}
