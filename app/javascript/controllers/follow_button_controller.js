import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'followerCount', 'followerMessage' ]

  connect() {
    this.update();
    console.log("connect follow button controller...")
  };

  update() {
    let message;
    console.log(this.followerCount)
    if (this.followerCount == 1 || this.followerCount == 0) {
      message = 'follower';
    } else {
      message = 'followers';
    }

    this.followerMessage = message;
  };

  set followerMessage(message) {
    console.log(message)
    this.followerMessageTarget.innerHTML = message;
  };

  get followerCount() {
    return this.followerCountTarget.innerHTML;
  };
};
