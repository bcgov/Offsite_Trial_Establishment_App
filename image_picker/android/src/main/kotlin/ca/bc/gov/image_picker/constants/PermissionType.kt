package ca.bc.gov.image_picker.constants

enum class PermissionType(val value: Int) {
    granted(1),
    limited(2),
    denied(3),
    deniedForever(4),
}