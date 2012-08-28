package frontlinesms2.webconnection

import frontlinesms2.*

class WebConnectionBaseSpec extends grails.plugin.geb.GebSpec {

	static createWebConnections() {
		def syncKeyword = new Keyword(value:"SYNC").save(failOnError:true)
		new WebConnection(name:"Sync", url:"http://www.frontlinesms.com/sync", sendMethod:"POST", keyword:syncKeyword).save(failOnError:true)
	}

	static createTestActivities() {
		Announcement.build(name:"Sample Announcement", sentMessageText:"Message to send")
		Fmessage.build(src:'announce')
	}

	static createTestMessages(WebConnection ec) {
		(0..90).each {
			def m = Fmessage.build(src:'Bob', text:"Test message $it", date:new Date()-it)
			ec.addToMessages(m)
			ec.save(failOnError:true, flush:true)
		}
	}
}