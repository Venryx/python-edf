#cython: language_level=3
# get constants
include "edf.pxi"

cdef extern from "edflib.h":
    int edf_set_patientcode(int, char *)
    int edfwrite_annotation_latin1(int, long long int, long long int, char *)
    int edfwrite_annotation_utf8(int handle, long long onset, long long duration, const char *description)
    int edflib_version()
    cdef struct edf_annotation_struct:
        long long int onset
        char * duration
        char * annotation
    int edf_get_annotation(int, int, edf_annotation_struct *)
    int edf_set_technician(int, char *)
    int edfread_digital_samples(int, int, int, int *)
    int edf_blockwrite_physical_samples(int, double *)
    int edf_set_recording_additional(int, char *)
    int edfwrite_physical_samples(int, double *)
    int edfwrite_annotation_utf8(int, long long int, long long int, char *)
    int edfclose_file(int)
    int edf_set_patientname(int, char *)
    int edf_set_physical_minimum(int, int, double)
    int edfread_physical_samples(int, int, int, double *)
    int edf_set_physical_maximum(int, int, double)
    int edfopen_file_writeonly(char *, int, int)
    int edf_set_patient_additional(int, char *)
    int edf_set_digital_maximum(int, int, int)
    cdef struct edf_param_struct:
        char  label[17]
        long long int smp_in_file
        double phys_max
        double phys_min
        int dig_max
        int dig_min
        int smp_in_datarecord
        char physdimension[9]
        char prefilter[81]
        char transducer[81]
        
    cdef struct edf_hdr_struct:
        int handle
        int filetype
        int edfsignals
        long long int file_duration
        int startdate_day
        int startdate_month
        int startdate_year
        long long int starttime_subsecond
        int starttime_second
        int starttime_minute
        int starttime_hour
        char * patient
        char * recording
        char * patientcode
        char * gender
        char * birthdate
        char * patient_name
        char * patient_additional
        char * admincode
        char * technician
        char * equipment
        char * recording_additional
        long long int datarecord_duration
        long long int datarecords_in_file
        long long int annotations_in_file
        edf_param_struct * signalparam
    
    int edfopen_file_readonly(char *, edf_hdr_struct *, int)
    int edf_set_birthdate(int, int, int, int)
    int edf_set_digital_minimum(int, int, int)
    int edfwrite_digital_samples(int, int *)
    int edfwrite_digital_short_samples(int handle, short *buf)
    int edf_set_equipment(int, char *)
    int edf_set_samplefrequency(int, int, int)
    int edf_set_admincode(int, char *)
    int edf_set_label(int, int, char *)
    int edf_blockwrite_digital_samples(int, int *)
    long long int edftell(int, int)
    void edfrewind(int, int)
    int edf_set_gender(int, int)
    int edf_set_physical_dimension(int, int, char *)
    int edf_set_transducer(int, int, char *)
    int edf_set_prefilter(int, int, char *)
    long long int edfseek(int, int, long long int, int)
    int edf_set_startdatetime(int, int, int, int, int, int, int)
    int edf_set_datarecord_duration(int, int)
    int edf_set_number_of_annotation_signals(int handle, int annot_signals)
    
    # new functions in 1.10
    int edflib_is_file_used(const char *)
    int edflib_get_number_of_open_files()
    int edflib_get_handle(int)
    int edf_write_digital_short_samples(int , short *)
    int edf_blockwrite_digital_short_samples(int, short *)
    int edf_blockwrite_digital_3byte_samples(int , void *)
