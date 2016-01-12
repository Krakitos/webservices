package etu.polytech.ws.rest.data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by momo- on 06/10/2015.
 */
@Entity
public class Activite  {

    @EmbeddedId
    private ActiviteId id;

    @Column(name = "nbloc")
    private short nbLoc;

    public Activite() {}

    public Activite(ActiviteId id, short nbLoc) {
        this.id = id;
        this.nbLoc = nbLoc;
    }

    public Sport getSport() {
        return id.sport;
    }

    public Date getDate() {
        return id.date;
    }

    public int getNbLoc() {
        return nbLoc;
    }

    @Override
    public String toString() {
        return "Activite{" +
                "sport=" + id.sport +
                ", date=" + id.date +
                ", nbLoc=" + nbLoc +
                '}';
    }

    @Embeddable
    public static class ActiviteId implements Serializable{

        @ManyToOne
        @JoinColumn(name = "numsej")
        private Sejour sejour;

        @ManyToOne
        @JoinColumn(name = "codesport")
        private Sport sport;

        @Column(name = "datejour")
        @Temporal(TemporalType.DATE)
        private Date date;
    }
}
