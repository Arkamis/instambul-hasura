
--
-- Base de datos: sicelhos_covidweb
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla trial
--

CREATE TABLE IF NOT EXISTS public.trial (
  trial_id varchar(34) NOT NULL,
  last_refreshed_on varchar(20) NOT NULL,
  public_title text NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla trial_contact
--

CREATE TABLE  IF NOT EXISTS public.trial_contact (
  trial_id varchar(34) NOT NULL,
  contact_firstname varchar(100) DEFAULT NULL,
  contact_lastname varchar(900) DEFAULT NULL,
  contact_address varchar(500) DEFAULT NULL,
  contact_email varchar(120) DEFAULT NULL,
  contact_tel varchar(60) DEFAULT NULL,
  contact_affiliation text DEFAULT NULL
);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla trial_criteria
--

CREATE TABLE IF NOT EXISTS public.trial_criteria (
  trial_id varchar(34) NOT NULL,
  inclusion_agemin varchar(16) DEFAULT NULL,
  inclusion_agemax varchar(21) DEFAULT NULL,
  inclusion_gender varchar(32) DEFAULT NULL,
  target_size varchar(254) DEFAULT NULL,
  countries text DEFAULT NULL,
  inclusion_criteria text DEFAULT NULL,
  exclusion_criteria text DEFAULT NULL
);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla trial_description
--

CREATE TABLE IF NOT EXISTS  public.trial_description (
  trial_id varchar(34) NOT NULL,
  scientific_title text DEFAULT NULL,
  acronym varchar(14) DEFAULT NULL,
  primary_sponsor varchar(200) DEFAULT NULL,
  web_address varchar(91) NOT NULL,
  recruitment_status varchar(14) DEFAULT NULL,
  other_records varchar(3) NOT NULL,
  date_enrollment varchar(18) DEFAULT NULL,
  study_type varchar(50) NOT NULL,
  study_design text DEFAULT NULL,
  phase varchar(150) DEFAULT NULL,
  conditions text DEFAULT NULL,
  intervention text DEFAULT NULL,
  primary_outcome text DEFAULT NULL,
  retrospective_flag varchar(3) NOT NULL,
  bridging_flag_true_false varchar(5) NOT NULL,
  bridged_type varchar(10) DEFAULT NULL
);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla trial_registration
--

CREATE TABLE IF NOT EXISTS public.trial_registration (
  trial_id varchar(34) NOT NULL,
  date_registration varchar(10) DEFAULT NULL,
  date_registration_3 integer NOT NULL,
  export_date varchar(20) NOT NULL,
  source_register varchar(31) NOT NULL
);



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla trial_results
--

CREATE TABLE IF NOT EXISTS public.trial_results (
  trial_id varchar(34) NOT NULL,
  results_date_posted varchar(10) DEFAULT NULL,
  results_date_completed varchar(10) DEFAULT NULL,
  results_url_link varchar(100) DEFAULT NULL,
  results_yes_no varchar(3) DEFAULT NULL
);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla trial
--
ALTER TABLE public.trial
  ADD PRIMARY KEY (trial_id);

--
--
-- Filtros para la tabla trial_contact
--
ALTER TABLE public.trial_contact
  ADD CONSTRAINT FK_trial_id_contact FOREIGN KEY (trial_id) REFERENCES trial (trial_id);

--
-- Filtros para la tabla trial_criteria
--
ALTER TABLE public.trial_criteria
  ADD CONSTRAINT FK_trial_id_criteria FOREIGN KEY (trial_id) REFERENCES trial (trial_id);

--
-- Filtros para la tabla trial_description
--
ALTER TABLE public.trial_description
  ADD CONSTRAINT FK_trial_id_description FOREIGN KEY (trial_id) REFERENCES trial (trial_id);

--
-- Filtros para la tabla trial_registration
--
ALTER TABLE public.trial_registration
  ADD CONSTRAINT FK_trial_id_registration FOREIGN KEY (trial_id) REFERENCES trial (trial_id);

--
-- Filtros para la tabla trial_results
--
ALTER TABLE public.trial_results
  ADD CONSTRAINT FK_trial_id_results FOREIGN KEY (trial_id) REFERENCES trial (trial_id);
COMMIT;

