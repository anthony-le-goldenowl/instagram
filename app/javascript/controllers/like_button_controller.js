import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['likeCount']
  
  connect() {
    console.log("connecting like button controller...")
  };
}
