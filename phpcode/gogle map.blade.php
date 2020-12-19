  <div class="col-md-12">
                  
                  <div class="form-group">
                    <label>Map Location</label>
                    <input type="text" value="" name="map_location" class="form-control" id="us3-address" placeholder="Enter map location" />
                  </div>

                  <div class="form-group">
                    <div id="us3" style="width: 100%; height: 300px;"></div>
                    <div class="clearfix">&nbsp;</div>
                    <div class="m-t-small"  style="display: none;">
                        <label class="p-r-small col-sm-1 control-label">{{ __('words.lat') }}.:</label>

                        <div class="col-sm-3">
                            <input type="text" name="latitude" class="form-control" style="width: 110px" id="us3-lat"/>
                        </div>
                        <label class="p-r-small col-sm-2 control-label">{{ __('words.lang') }}.:</label>

                        <div class="col-sm-3">
                            <input type="text" name="longitude" class="form-control" style="width: 110px" id="us3-lon"/>
                        </div>
                     </div>
                    <div class="clearfix"></div>
                  </div>

                 </div>
@push('css')
  <style type="text/css">
    .time-table .checkbox{
       width: 15px;
    }
    .ui-timepicker-wrapper{
      width: 169px;
    }
  </style>
@endpush
@push('js')
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGQC7r17YyESlAGS8raZ0G1Q-r9Q1s4Vk&?sensor=false&libraries=places" type="text/javascript"></script>
  <script src="{{asset('public/js')}}/locationpicker.jquery.min.js"></script>
  <!-- Bootstarap Validator script -->
  <script type="text/javascript" src="{{asset('public/assets/backend/js/pages/user/edit.js')}}"></script>
    <script type="text/javascript">
     @if($data['user']->is_blocked)
        $('.inactive-reason-wrapper').show();
     @else
        $('.inactive-reason-wrapper').hide();
     @endif
  </script>
   <script type="text/javascript">
       @if(old('country'))
       var country_id = "{{old('country')}}";
     @endif
     @if(old('state'))
       var state_id = "{{old('state')}}";
     @endif
     @if(old('city'))
       var city_id = "{{old('city')}}";
     @endif
  </script>
  <script>
      $('#us3').locationpicker({
          location: {
              latitude: @if(old('latitude')) {{old('latitude')}} @else 0 @endif ,
              longitude:  @if(old('longitude')) {{old('longitude')}} @else 0 @endif 
          },
          radius: 200,
          inputBinding: {
              latitudeInput: $('#us3-lat'),
              longitudeInput: $('#us3-lon'),
              radiusInput: $('#us3-radius'),
              locationNameInput: $('#us3-address'),
          },
          enableAutocomplete: true,
          markerIcon: '{{asset('assets/system/images/mapmarker.png')}}',
          markerDraggable: true,
          markerVisible : true,
          draggable: true,
          enableReverseGeocode: true,
      });
</script>
<script type="text/javascript">
     $('.timepicker').timepicker({
          'ampm': true,
          'timeFormat': 'h : i A',
          'scrollDefault': 'now',
          'setTime': new Date(),
          'startTime' : '10:00 A',
          'step': 5 
     });
</script>
<script type="text/javascript">
    // Listen for click on toggle checkbox
    $('.global-checkbox').click(function(event) {   
    if(this.checked) {
        // Iterate each checkbox
        $(':checkbox').each(function() {
            this.checked = true;                        
        });
    } else {
        $(':checkbox').each(function() {
            this.checked = false;                       
        });
    }
    });
</script>
@endpush
