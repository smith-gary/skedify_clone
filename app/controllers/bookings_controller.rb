class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @availability = Availability.find(params[:availability_id]) if params[:availability_id]
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  # def create
  #   @booking = Booking.new(booking_params)

  #   respond_to do |format|
  #     if @booking.save
  #       format.html { redirect_to @booking, notice: "Booking was successfully created." }
  #       format.json { render :show, status: :created, location: @booking }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @booking.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
     @availability = Availability.find(params[:availability_id]) # assign it here
    if @availability.booking.present?
      redirect_to availabilities_path, alert: "Slot already booked."
    else
      @booking = Booking.new(booking_params)
      if @booking.save
        redirect_to bookings_path, notice: "Appointment booked."
      else
        render :new
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to bookings_path, status: :see_other, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.expect(booking: [ :availability_id, :client_email, :status ])
    end
end
