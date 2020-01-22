    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="well well-sm">
                    <form class="form-horizontal" method="post">
                        <fieldset>
                            <legend class="text-center header">Project Upload Form</legend>
    
                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                                <div class="col-md-8">
                                    <input id="fname" name="name" type="text" placeholder="Proyect Name" class="form-control">
                                </div>
                            </div>
                            <div class="form-group"> <!-- type of game -->
                                <label for="state_id" class="control-label col-md-1 col-md-offset-2 text-center"></label>
                                <select class="form-control" id="state_id">
                                    <option value="AL">Action Game</option>
                                    <option value="AK">Fighting Game</option>
                                    <option value="AZ">Adventure Game</option>
                                    <option value="AR">Strategy Game</option>
                                    <option value="CA">Simulator Game</option>
                                    <option value="CO">Sports Game</option>
                                    <option value="CT">Music Game</option>                                    
                                </select>
                                <br>                    
                                <div class="custom-control custom-checkbox">
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                    <label class="form-check-label" for="defaultCheck1">
                                      Programmer
                                    </label>
                                        <input type="number" class="form-control" id="programmer_num">
                                    <br>
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                    <label class="form-check-label" for="defaultCheck1">
                                      Illustrator
                                    </label>
                                    <input type="number" class="form-control" id="illustrator_num">
                                    <br>
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                    <label class="form-check-label" for="defaultCheck1">
                                      Designer
                                    </label>
                                    <input type="number" class="form-control" id="designer_num">
                                    <br>
                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                    <label class="form-check-label" for="defaultCheck1">
                                      Music Producer
                                    </label>
                                    <input type="number" class="form-control" id="music_num">
                                </div>
    
                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>
                                <div class="col-md-8">
                                    <input id="phone" name="phone" type="text" placeholder="Write some tags related to your idea" class="form-control">
                                </div>
                            </div>
    
                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
                                <div class="col-md-8">
                                    <textarea class="form-control" id="message" name="message" placeholder="Enter a short (or not) description of your idea." rows="7"></textarea>
                                </div>
                            </div>
                            <div class="container">
                                <div class="form-group col-xs-12 col-sm-6 col-md-4">
                                  <label for="banner"></label>
                                  <div class="input-group">
                                      <label class="input-group-btn">
                                          <span class="btn btn-primary btn-file">
                                              <input accept=".jpg,.png,.jpeg,.gif" class="hidden" name="banner" type="file" id="banner">
                                          </span>
                                      </label>
                                  </div>
                              </div>
                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>