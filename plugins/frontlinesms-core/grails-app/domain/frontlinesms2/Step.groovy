package frontlinesms2

abstract class Step {
	String type
	static hasMany = [stepProperties: StepProperty]
	static configFields = [:]

	static constraints = {
		// the following assumes all configFields are mandatory
		stepProperties(nullable: true, validator: { val, obj ->
			if (!val) return false
			val*.key?.containsAll(obj.configFields?.collect { name, type -> name })
		})
	}
	
	def process(Fmessage message) {

	}

	String getPropertyValue(key) {
		stepProperties?.find { it.key == key }?.value
	}

	def setPropertyValue(key, value){
		stepProperties?.find { it.key == key }?.value = value
	}

	// helper method to retrieve list of entities saved as StepProperties
	def getEntityList(entityType, propertyName) {
		entityType.getAll(StepProperty.findAllByStepAndKey(this, propertyName)*.value) - null
	}
}