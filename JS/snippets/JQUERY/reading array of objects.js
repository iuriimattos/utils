for (let props in this.hotspots) {
  for (let propIn in this.hotspots[props]) {
    this.hotspotList.push(this.hotspots[props][propIn]);
  }
}
