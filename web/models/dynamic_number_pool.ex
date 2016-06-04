defmodule ElixirProject.DynamicNumberPool do
  use ElixirProject.Web, :model

  @default_pool_size 25
  @default_cookie_wait_msec 2000
  @daily_session_clicks_per_number_hour 20
  @default_lifetime_seconds 1800
  @default_unique_clicks_per_day @default_pool_size * @daily_session_clicks_per_number_hour * 3600 / @default_lifetime_seconds
  @lifetime_seconds_max 86400

  @hubspot_user_token_friendly_param_name 'hubspot_user_token'
  @hubspot_user_token_cookie_name 'hubspotutk'

  @excessive_dynamic_number_pool_referrers_threshold 100

  @dnp_extended_param_limit 25
  @mysql_text_utf8_limit 21845

  schema "dynamic_number_pools" do
    field :name,                      :string
    field :pool_type,                 PoolTypeEnum
    field :destination_type,          DestinationTypeEnum
    field :destination_url,           :string
    field :max_pool_size,             :integer
    field :max_pool_size_allowed,     :integer
    field :unique_clicks_per_day,     :integer
    field :lifetime_seconds,          :integer
    field :prefer_number_reuse,       :boolean
    field :preferred,                 :boolean
    field :editable,                  :boolean
    field :passthrough,               :boolean

    field :param1,       :string
    field :param1_type,  ParamTypeEnum
    field :param1_regex, :string
    field :param2,       :string
    field :param2_type,  ParamTypeEnum
    field :param2_regex, :string
    field :param3,       :string
    field :param3_type,  ParamTypeEnum
    field :param3_regex, :string
    field :param4,       :string
    field :param4_type,  ParamTypeEnum
    field :param4_regex, :string
    field :param5,       :string
    field :param5_type,  ParamTypeEnum
    field :param5_regex, :string
    field :param6,       :string
    field :param6_type,  ParamTypeEnum
    field :param6_regex, :string
    field :param7,       :string
    field :param7_type,  ParamTypeEnum
    field :param7_regex, :string
    field :param8,       :string
    field :param8_type,  ParamTypeEnum
    field :param8_regex, :string
    field :param9,       :string
    field :param9_type,  ParamTypeEnum
    field :param9_regex, :string
    field :param10,       :string
    field :param10_type,  ParamTypeEnum
    field :param10_regex, :string
    field :param11,       :string
    field :param11_type,  ParamTypeEnum
    field :param11_regex, :string
    field :param12,       :string
    field :param12_type,  ParamTypeEnum
    field :param12_regex, :string
    field :param13,       :string
    field :param13_type,  ParamTypeEnum
    field :param13_regex, :string
    field :param14,       :string
    field :param14_type,  ParamTypeEnum
    field :param14_regex, :string
    field :param15,       :string
    field :param15_type,  ParamTypeEnum
    field :param15_regex, :string
    field :param16,       :string
    field :param16_type,  ParamTypeEnum
    field :param16_regex, :string
    field :param17,       :string
    field :param17_type,  ParamTypeEnum
    field :param17_regex, :string
    field :param18,       :string
    field :param18_type,  ParamTypeEnum
    field :param18_regex, :string
    field :param19,       :string
    field :param19_type,  ParamTypeEnum
    field :param19_regex, :string
    field :param20,       :string
    field :param20_type,  ParamTypeEnum
    field :param20_regex, :string
    field :param21,       :string
    field :param21_type,  ParamTypeEnum
    field :param21_regex, :string
    field :param22,       :string
    field :param22_type,  ParamTypeEnum
    field :param22_regex, :string
    field :param23,       :string
    field :param23_type,  ParamTypeEnum
    field :param23_regex, :string
    field :param24,       :string
    field :param24_type,  ParamTypeEnum
    field :param24_regex, :string
    field :param25,       :string
    field :param25_type,  ParamTypeEnum
    field :param25_regex, :string

    field :cookie_wait_time,          :integer

    field :search_google_organic, :boolean
    field :search_google_paid, :boolean
    field :search_bing_organic, :boolean
    field :search_bing_paid, :boolean
    field :search_yahoo_organic, :boolean
    field :search_yahoo_paid, :boolean
    field :search_aol_organic, :boolean
    field :search_aol_paid, :boolean

    field :api_key,                   :string
    field :local_center,              :string
    field :local_npa,                 :string
    field :local_nxx,                 :string
    field :tn_prefix_whitelist,       :string
    field :zipcode,                   :string
    field :latitude,                  :decimal
    field :longitude,                 :decimal
    field :local_state,               :string
    field :pool_location,             :string

    field :preallocation_count,       :integer

    field :daily_max_pool_attributions_in_session,          :integer
    field :daily_max_overflow_attributions_in_session,      :integer
    field :daily_max_virtual_lines,                         :integer
    field :daily_total_pool_attributions_count,             :integer
    field :daily_total_overflow_attributions_count,         :integer

    field :past_weeks_total_pool_attributions_count,        :integer
    field :past_weeks_total_overflow_attributions_count,    :integer

    field :past_30_days_autosize_metrics,                   :string

    timestamps
  end

  @required_fields ~w()
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def all do
    query = from dnp in ElixirProject.DynamicNumberPool, select: dnp
    #Simple.Repo.all(query)
  end

end
